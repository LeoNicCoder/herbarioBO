package entidades.fichas_tecnicas;

public class Tbl_genus {
	private int id;
	private String name;
	private Tbl_family family;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Tbl_family getFamily() {
		return family;
	}
	public void setFamily(Tbl_family family) {
		this.family = family;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
