package examples.contas;

import com.intuit.karate.junit5.Karate;

class ContasRunner {

    @Karate.Test
    Karate testContas() {
        return Karate.run("contas").relativeTo(getClass());
    }

}
