package examples.autorizacao;

import com.intuit.karate.junit5.Karate;

class AutorizacaoRunner {

    @Karate.Test
    Karate testAutorizacao() {
        return Karate.run("autorizacao").relativeTo(getClass());
    }

}
