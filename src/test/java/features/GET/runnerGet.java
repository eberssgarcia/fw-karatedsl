package features.GET;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class runnerGet {

    @Test
    public Karate runTest() {
        return Karate.run("getRequest")
//                .tags("~@ignore")
                .relativeTo(getClass());
    }
}
