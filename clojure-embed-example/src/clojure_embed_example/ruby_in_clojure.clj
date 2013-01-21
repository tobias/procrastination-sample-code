(ns clojure-embed-example.ruby-in-clojure
  (import [org.jruby Ruby RubyInstanceConfig RubyString]
          org.jruby.runtime.builtin.IRubyObject))

(def ruby (delay
           (Ruby/newInstance (doto (RubyInstanceConfig.)
                               (.setLoadPaths ["src/ruby"])))))

(defn ruby-args [& args]
  (into-array IRubyObject args))

(defn ruby-string [v]
  (RubyString/newInternalFromJavaExternal @ruby (str v)))

(defn haminize [thing]
  (.evalScriptlet @ruby "require 'haminator'")
  (-> (.evalScriptlet @ruby "Haminator.new")
      (.callMethod "haminize" (ruby-args (ruby-string thing)))
      str))
