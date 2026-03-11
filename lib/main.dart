import 'package:flutter/material.dart';

// 1. Modelo de datos
class Producto {
  final String nombre;
  final String precio;
  final String imgUrl;

  Producto({required this.nombre, required this.precio, required this.imgUrl});
}

void main() => runApp(const CarritoApp());

class CarritoApp extends StatelessWidget {
  const CarritoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Fondo rosa claro solicitado
        backgroundColor: const Color(0xFFFCE4EC), 
        body: const PantallaPrincipal(),
      ),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de 4 productos
    final List<Producto> productos = [
      Producto(nombre: 'BMW M3', precio: '\$299,000,000', imgUrl: 'https://raw.githubusercontent.com/GarciaValenciaJulian0498/IAMoviles-Act-14-navegaci-n-entre-6-pantallas/refs/heads/master/carros/bmw.jpg'),
      Producto(nombre: 'RAM TRX', precio: '\$299,000,000', imgUrl: 'https://raw.githubusercontent.com/GarciaValenciaJulian0498/IAMoviles-Act-14-navegaci-n-entre-6-pantallas/refs/heads/master/carros/trx.jpg'),
      Producto(nombre: 'RAM TRX BLACK', precio: '\$299,000,000', imgUrl: 'https://raw.githubusercontent.com/GarciaValenciaJulian0498/IAMoviles-Act-14-navegaci-n-entre-6-pantallas/refs/heads/master/carros/trx1.jpg'),
      Producto(nombre: 'TOYOTA COROLA', precio: '\$99,900,000', imgUrl: 'https://raw.githubusercontent.com/GarciaValenciaJulian0498/IAMoviles-Act-14-navegaci-n-entre-6-pantallas/refs/heads/master/carros/toyota.jpg'),
      Producto(nombre: 'TESLA CYBERTRUCK', precio: '\$150,000,000', imgUrl: 'https://raw.githubusercontent.com/GarciaValenciaJulian0498/IAMoviles-Act-14-navegaci-n-entre-6-pantallas/refs/heads/master/carros/tesla.jfif'),
      Producto(nombre: 'BMW X6', precio: '\$85,000,000', imgUrl: 'https://raw.githubusercontent.com/GarciaValenciaJulian0498/IAMoviles-Act-14-navegaci-n-entre-6-pantallas/refs/heads/master/carros/bmwx6.jfif'),
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ELEMENTO 1: Icono de perfil a la derecha
            const Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.pinkAccent),
              ),
            ),
            const SizedBox(height: 20),

            // ELEMENTO 2: Fila con Buscador y Botón de Filtros
            Row(
              children: [
                // Buscador (ocupa el espacio sobrante)
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Buscar productos...",
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Botón de Filtros solo con Texto
                GestureDetector(
                  onTap: () {
                    // Acción al presionar filtros
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      "Filtros",
                      style: TextStyle(
                        color: Colors.pink, // Color llamativo para que resalte
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // ELEMENTO 3: Columna con 2 Filas de 2 Tarjetas (Total 4 carros)
            Column(
              children: [
                Row(
                  children: [
                    Expanded(child: TarjetaProducto(producto: productos[0])),
                    const SizedBox(width: 10),
                    Expanded(child: TarjetaProducto(producto: productos[1])),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(child: TarjetaProducto(producto: productos[2])),
                    const SizedBox(width: 10),
                    Expanded(child: TarjetaProducto(producto: productos[3])),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: TarjetaProducto(producto: productos[4])),
                    const SizedBox(width: 10),
                    Expanded(child: TarjetaProducto(producto: productos[5])),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget de la Tarjeta (Card)
class TarjetaProducto extends StatelessWidget {
  final Producto producto;
  const TarjetaProducto({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // 1. Imagen centrada
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                producto.imgUrl,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            // 2. Nombre del producto
            Text(
              producto.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            // 3. Fila con Precio y Botón "Detalles"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  producto.precio,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF008080), // Verde azulado (Teal)
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    minimumSize: const Size(60, 30),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Detalles", style: TextStyle(fontSize: 10, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}