package portal.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class LoginUser implements Serializable {

    private String userId;
    private String userName;
    private String department;

}
