
require "json"
require "ibm_watson/tone_analyzer_v3"
include IBMWatson

tone_analyzer = ToneAnalyzerV3.new(
  version: "2017-09-21",
  iam_apikey: ENV['TEXT_KEY'] ,
  url: "https://gateway.watsonplatform.net/tone-analyzer/api"
)
