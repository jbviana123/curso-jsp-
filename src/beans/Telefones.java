package beans;

public class Telefones {
	
	private long id;
	private String numero;
	private String tipo;
	private long usuario;
	
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public long getUsuario() {
		return usuario;
	}
	public void setUsuario(long usuario) {
		this.usuario = usuario;
	}
	@Override
	public String toString() {
		return "Telefones [id=" + id + ", numero=" + numero + ", tipo=" + tipo + ", usuario=" + usuario + "]";
	}
	
	
	

}
