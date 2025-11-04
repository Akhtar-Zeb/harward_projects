# Load the books.csv file
books <- read.csv("books.csv")

# Load the authors.csv file
authors <- read.csv("authors.csv")

# ----------------------------------------------------- #

# The Writer

# Filter the index of book where author == "Mia Morgan's"
filter1 <- which(books$author == "Mia Morgan")

# Apply filter to see Title of the Books
writer <- books[filter1, ]

# Now Print The Title
print(writer$title)

# ----------------------------------------------------- #

# The Musician

# Filter the index of book where topic == "Music" and year == 1613
filter2 <- which(books$year == 1613 & books$topic == "Music")

# Apply filter to see Title of the Books
musician <- books[filter2, ]

# Now Print The Title
print(musician$title)

# ----------------------------------------------------- #

# The Traveler

# Filter the index of book where author in "Lysandra Silverleaf" or "Elena Petrova" and year is 1775
filter3 <- which(books$author == c("Lysandra Silverleaf", "Elena Petrova") & books$year == 1775)

# Apply filter
traveler <- books[filter3, ]

# Now Print The Title
print(traveler$title)

# ----------------------------------------------------- #

# The Painter

# Filter the index of book where topic is Art and year in 1992, 1990 and pages Between 200 and 300
filter4 <- which(books$topic == "Art" & books$year == c(1992, 1990))

# Apply Filter
painter <- books[filter4, ]

# print book Title
print(painter$title)

# ----------------------------------------------------- #

# The Scientist

# Find Quantum Mechanics in title
filter5 <- grepl("Quantum Mechanics", books$title)

# Apply Filter
scientist <- books[filter5, ]

# Print Title
print(scientist$title)

# ----------------------------------------------------- #

# The Teacher

# First find the name of the author
zenthia_filter <- which(authors$hometown == "Zenthia")
zenthia_authers <- authors[zenthia_filter, 1]

# Save the name by applying the filter
education_filter <- which(books$topic == "Education")
education_books <- books[education_filter, ]

year_1700s <- education_books$year >= 1700 & education_books$year <= 1799

education_1700s_books <- education_books[year_1700s, ]
education_1700s_books

books <- education_1700s_books[education_1700s_books$author %in% zenthia_authers, ]
books

print(books$title)
