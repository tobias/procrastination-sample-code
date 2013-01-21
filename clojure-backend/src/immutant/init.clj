(ns immutant.init
  (:use clojure-backend.core)
  (:require [immutant.messaging :as msg]
            [immutant.web :as web]))

(web/start app)

(msg/start "/queue/sync")

(msg/respond "/queue/sync"
             (fn [m]
               (haminize-map (:message m))))
























(msg/start "/queue/async")

(msg/listen "/queue/async"
            (fn [m]
              (msg/publish "/queue/results"
                           (haminize-map m)
                           :encoding :edn)))
