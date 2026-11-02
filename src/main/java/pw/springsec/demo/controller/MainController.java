package pw.springsec.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import pw.springsec.demo.model.Producto;
import pw.springsec.demo.service.ProductoService;


@Controller
public class MainController {

	@Autowired
	private ProductoService productoService;

	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("productos", productoService.getAllProductos());
		return "index";
	}

	@GetMapping("/new")
	public String nuevo(Model model) {
		model.addAttribute("producto", new Producto());
		return "nuevo-producto";
	}

	@PostMapping("/save")
	public String guardar(@ModelAttribute Producto producto) {
		productoService.createProducto(producto);
		return "redirect:/";
	}

	@GetMapping("/edit/{id}")
	public String editar(@PathVariable Long id, Model model) {
		model.addAttribute("producto", productoService.getProductoById(id).orElseThrow());
		return "editar-producto";
	}

	@PostMapping("/update/{id}")
	public String actualizar(@PathVariable Long id, @ModelAttribute Producto producto) {
		productoService.updateProducto(id, producto);
		return "redirect:/";
	}

	@PostMapping("/delete/{id}")
	public String eliminar(@PathVariable Long id) {
		productoService.deleteProducto(id);
		return "redirect:/";
	}

}