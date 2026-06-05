args <- commandArgs(trailingOnly = TRUE)

if (length(args) < 1) {
  stop("Usage: Rscript analyze_freelancer_income.R <input_csv> [output_csv]")
}

input_csv <- args[1]
output_csv <- if (length(args) >= 2) args[2] else NA

data <- read.csv(input_csv, stringsAsFactors = FALSE)

required_columns <- c("industry", "income")
missing_columns <- setdiff(required_columns, names(data))

if (length(missing_columns) > 0) {
  stop(
    paste(
      "Input CSV is missing required column(s):",
      paste(missing_columns, collapse = ", ")
    )
  )
}

data$income <- as.numeric(data$income)
data$industry <- trimws(data$industry)
valid_income <- !is.na(data$income)
valid_industry <- !is.na(data$industry) & data$industry != ""
data <- data[valid_income & valid_industry, ]

if (nrow(data) == 0) {
  stop("No valid records found after filtering invalid industry or income values.")
}

industry_summary <- aggregate(
  income ~ industry,
  data = data,
  FUN = function(x) c(
    freelancers = length(x),
    total_income = sum(x),
    average_income = mean(x),
    median_income = median(x),
    min_income = min(x),
    max_income = max(x)
  )
)

industry_summary <- data.frame(
  industry = industry_summary$industry,
  freelancers = industry_summary$income[, "freelancers"],
  total_income = industry_summary$income[, "total_income"],
  average_income = industry_summary$income[, "average_income"],
  median_income = industry_summary$income[, "median_income"],
  min_income = industry_summary$income[, "min_income"],
  max_income = industry_summary$income[, "max_income"],
  row.names = NULL
)

industry_summary <- industry_summary[order(-industry_summary$average_income), ]

print(industry_summary, row.names = FALSE)

if (!is.na(output_csv)) {
  write.csv(industry_summary, output_csv, row.names = FALSE)
  message("Summary saved to: ", output_csv)
}
