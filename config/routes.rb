Rails.application.routes.draw do
  post 'slackbot', to: 'slackbots#event'
  get 'slackbot', to: 'slackbots#test'
end
