package examples.reset;

import com.intuit.karate.junit5.Karate;

class ResetRunner {

    @Karate.Test
    Karate testReset() {
        return Karate.run("reset").relativeTo(getClass());
    }

}
