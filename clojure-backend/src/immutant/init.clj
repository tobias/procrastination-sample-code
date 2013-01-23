(ns immutant.init
  (:use clojure-backend.core)
  (:require [immutant.messaging :as msg]
            [immutant.web :as web]))

(web/start app)

(msg/start "/queue/sync")

(msg/respond "/queue/sync" haminize)


























(msg/start "/queue/async")
(msg/start "/queue/results")

(msg/listen "/queue/async"
            (fn [m]
              (msg/publish "/queue/results"
                           (haminize m)
                           :encoding :edn)))
