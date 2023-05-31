package examples.users;
//runners are specific to package
import com.intuit.karate.junit5.Karate;

class UsersRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("users").tags("@wip").relativeTo(getClass());
    }    

}
