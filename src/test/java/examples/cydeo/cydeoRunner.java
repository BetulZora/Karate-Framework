package examples.cydeo;

import com.intuit.karate.junit5.Karate;

class CydeoRunner {

    // can change the path to any feature in any folder. But the path is required.
    @Karate.Test
    Karate testFeatures() {
        return Karate.run("bookITTests").tags("@wip").relativeTo(getClass());
    }
}
