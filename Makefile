.PHONY: clean


clean:
	rm -rf figures
	rm -rf derived_data
	rm -rf .created-dirs


.created-dirs:
	mkdir -p figures
	mkdir -p derived_data
	touch .created-dirs
	

derived_data/hotel_bookings_preprocessed.csv derived_data/hotel_bookings_preprocessed1.csv: .created-dirs pre_process.R source_data/hotel_bookings.csv
	Rscript pre_process.R

derived_data/varimp.csv: logistic.R source_data/hotel_bookings.csv derived_data/hotel_bookings_preprocessed1.csv
	Rscript logistic.R

figures/city_hotel_vs_resort_hotel.png figures/city_hotel_vs_resort_hotel_month.png: source_data/hotel_bookings.csv city_hotel_vs_resort_hotel.R derived_data/hotel_bookings_preprocessed.csv
	Rscript city_hotel_vs_resort_hotel.R

figures/decision_tree.png: source_data/hotel_bookings.csv derived_data/hotel_bookings_preprocessed1.csv decision_tree.R
	Rscript decision_tree.R

Report.pdf:\
 report.Rmd\
 figures/city_hotel_vs_resort_hotel.png\
 figures/city_hotel_vs_resort_hotel_month.png\
 figures/decision_tree.png\
 derived_data/varimp.csv
	Rscript -e "rmarkdown::render('report.Rmd',output_format='pdf_document')"
	
