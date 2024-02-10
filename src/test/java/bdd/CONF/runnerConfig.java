package bdd.CONF;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class runnerConfig {

    @Test
    public Karate runTest() {
        return Karate.run("configuration")
//                .tags("~@ignore")
                .relativeTo(getClass());
    }
}
