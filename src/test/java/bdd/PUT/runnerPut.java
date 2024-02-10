package bdd.PUT;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class runnerPut {

    @Test
    public Karate runTest() {
        return Karate.run("putPetEntry")
//                .tags("~@ignore")
                .relativeTo(getClass());
    }

}
