package code;
import java.time.LocalDate;

public class Todo {

    private final long id;
    private String task;
    private String description;
    private int year;

    public Todo(long id, String task, String description) {
        this.id = id;
        this.setTask(task);
        this.setDescription(description);
    }

	public long getId() {
		return id;
	}

	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) throws Exception {
		
		if (LocalDate.now().isBefore(LocalDate.of(year, 1, 1)))
			this.year = year;
		else 
			throw new Exception("Year has passed already.");
	}

    
}