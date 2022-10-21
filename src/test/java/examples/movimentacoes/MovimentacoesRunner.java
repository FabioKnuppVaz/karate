package examples.movimentacoes;

import com.intuit.karate.junit5.Karate;

class MovimentacoesRunner {

    @Karate.Test
    Karate testMovimentacoes() {
        return Karate.run("movimentacoes").relativeTo(getClass());
    }

}
