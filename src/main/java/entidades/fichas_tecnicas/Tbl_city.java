package entidades.fichas_tecnicas;

public class Tbl_city {
	private int id;
	private String name;
	private Tbl_state state;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Tbl_state getState() {
		return state;
	}
	public void setState(Tbl_state state) {
		this.state = state;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
