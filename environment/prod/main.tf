module "cost-generator" {
  source           = "../../modules/cost-generator"
  project-name     = "SetPoint"
  calculation-type = "monthly" //   # daily, weekly, monthly are the options (daily calculates the cost for the previous day, monthly calculates the cost for the current month, up until today, weekly calculates the cost for the previous week)
  cron-expression = "cron(0 7 ? * MON *)" // 9:00AM every Monday
  aws-region      = var.region
  sns-topic-name  = "budget-notifications"
  sns-endpoint    = "kristijan.eftimov@pcg.io"
  sns-po-endpoint = "isidora.ovezoska@pcg.io" // both emails will receive the notification
}