package org.techlms.demoitest.model.util;

import java.util.HashMap;
import java.util.Map;

public class CourseDataSplitter {

    /**
     * Splits a timetable entry string into course code and course type.
     *
     * @param data The input string in the format "<course_code> (<course_type>)".
     * @return A map containing "courseCode" and "courseType" as keys. Empty values if input is null or invalid.
     */
    public static Map<String, String> splitCourseData(String data) {
        Map<String, String> result = new HashMap<>();

        if (data == null || data.isEmpty()) {
            result.put("courseCode", "");
            result.put("courseType", "");
            return result;
        }

        String[] parts = data.split(" ");
        if (parts.length > 0) {
            // Extract course code
            result.put("courseCode", parts[0]);
        }

        // Extract course type
        if (data.contains("(") && data.contains(")")) {
            int start = data.indexOf('(') + 1;
            int end = data.indexOf(')');
            if (start < end) {
                String courseType = data.substring(start, end);
                result.put("courseType", courseType);
            }
        }

        return result;
    }
}
