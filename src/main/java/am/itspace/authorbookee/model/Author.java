package am.itspace.authorbookee.model;


import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Author {

    private int id;
    private String name;
    private String surname;
    private String phone;
    private Date dateOfBirthday;
    private Gender gender;

}
