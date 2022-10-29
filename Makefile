.PHONY: clean


clean:
	rm -rf figures
      	rm -rf derived_data
      	rm -rf .created-dirs


.created-dirs:
	mkdir -p figures
	mkdir -p derived_data
	touch .created-dirs
	

derived_data/hotel_bookings_preprocessed.csv:\
  .created-dirs pre-process.R source_data/hotel_bookings.csv
	Rscript pre-process.R

figures/city_hotel_vs_resort_hotel.png\
  figures/city_hotel_vs_resort_hotel_month.png:\
    source_data/hotel_bookings.csv city_hotel_vs_resort_hotel.R derived_data/hotel_bookings_preprocessed.csv
	Rscript city_hotel_vs_resort_hotel.R

Report.pdf:\
 report.Rmd\
 figures/city_hotel_vs_resort_hotel.png\
 figures/city_hotel_vs_resort_hotel_month.png
	Rscript -e "rmarkdown::render('report.Rmd',output_format='pdf_document')"
	
