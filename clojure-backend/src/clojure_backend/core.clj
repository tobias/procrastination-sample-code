(ns clojure-backend.core
  (:require [ring.middleware.params :as p]))

(defn haminize [thing]
  (str "ham " thing))

(defn haminize-map [data]
  (reduce (fn [m [k v]]
            (assoc m k (haminize v))) {} data))

(defn handler [request]
  (binding [*read-eval* false]
    {:status 200
     :headers {"Content-Type" "text/plain"}
     :body (->> (-> request :params (get "data"))
                read-string
                haminize-map
                pr-str)}))

(def app
  (p/wrap-params handler))


