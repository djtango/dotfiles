{
 :user {
        ;; :jvm-opts ["-Dclojure.server.repl={:port,50505,:accept,clojure.core.server/repl}"]
        :jvm-opts ["-XX:-OmitStackTraceInFastThrow"]
        :plugins  [[lein-count "1.0.9"]]
        }
 :rebl {
        :dependencies [[com.bhauman/rebel-readline "0.1.4"]]
        :aliases {"rebl" ["trampoline" "run" "-m" "rebel-readline.main"]}
        :jvm-opts [
                   "-Dclojure.server.repl={:port,50505,:accept,clojure.core.server/repl}"
                   "-XX:-OmitStackTraceInFastThrow"
                   ;; #=(let [repl-port (or (System/getenv "CLJ_REPL_PORT") 50505)]
                   ;;     (println "Binding Socket REPL to port " repl-port)
                   ;;     (str "-Dclojure.server.repl={:port,"
                   ;;          repl-port
                   ;;          ",:accept,clojure.core.server/repl}"))
                   ]
        ;; :dependencies [[com.bhauman/rebel-readline "0.1.4"]]
        ;; :aliases {"rebl" ["trampoline" "run" "-m" "rebel-readline.main"]}
        }
}
