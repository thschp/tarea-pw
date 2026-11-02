package pw.springsec.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pw.springsec.demo.model.Producto;


public interface ProductoRepository extends JpaRepository<Producto, Long> {

}
