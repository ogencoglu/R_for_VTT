# R Lecture to VTT - Lecture 4
# Author                : Oguzhan Gencoglu
# Latest Version        : 11.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Mining PubMed --------------

library(RISmed)

# exploratory analysis without downloading the data
search_query <- EUtilsSummary("heart disease", datetype='pdat', mindate=2010, maxdate=2016, retmax=50)
QueryCount(search_query)

# get the data
records <- EUtilsGet(search_query)
pubmed_data <- data.frame('ArticleTitle'= ArticleTitle(records), 
                          'Abstract'= AbstractText(records),
                          'YearAccepted' = YearAccepted(records),
                          'YearPublish' = YearPpublish(records),
                          'Language' = Language(records),
                          'ELocationID' = ELocationID(records),
                          'Country' = Country(records),
                          'Cited' = Cited(records),
                          'PublicationStatus' = PublicationStatus(records),
                          #'PublicationType' = PublicationType(records)
                          'JournalTitle' = Title(records)
)
authors <- Author(records)
