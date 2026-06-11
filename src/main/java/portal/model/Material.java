package portal.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Material {

    private int materialId;
    private String title;
    private String category;
    private String difficulty;
    private String description;
    private int displayOrder;
    private int memoCount;
}
