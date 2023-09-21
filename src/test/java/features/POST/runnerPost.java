package features.POST;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class runnerPost {

    @Test
    public Karate runTest() {
        return Karate.run("createNewPet")
//                .tags("~@ignore")
                .relativeTo(getClass());
    }
}
