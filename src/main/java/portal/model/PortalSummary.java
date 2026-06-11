package portal.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class PortalSummary {

    private int materialCount;
    private int categoryCount;
    private int memoCount;
    private String latestMemoDateTime;
    private double averageMemoCount;
}
