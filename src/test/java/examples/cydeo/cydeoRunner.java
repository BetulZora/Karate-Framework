package examples.cydeo;

import com.intuit.karate.junit5.Karate;

class cydeoRunner {

    // can change the path to any feature in any folder. But the path is required.
    @Karate.Test
    Karate testFeatures() {
        return Karate.run("classpath:examples").tags("@wip").relativeTo(getClass());
    }

}
/*
in the .tags() section put "@tagName" to test specifically those tags
OR use "~@tagName" to exclude specific tests
 */
/*
to do parallel testing
 */