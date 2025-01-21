import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksDrawer extends StatelessWidget {
  const LinksDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Encabezado con gradiente y estilo personalizado
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 59, 115, 247),
                  Color(0xFF2F509D),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.book,
                  size: 50.r,
                  color: Colors.white,
                ),
                SizedBox(width: 16.w),
                Expanded(
                  // Se ajusta al espacio disponible
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cursos y Recursos',
                        style: TextStyle(
                          fontSize:
                              18.sp, // Reducir ligeramente si es necesario
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow:
                            TextOverflow.ellipsis, // Asegura que no se salga
                        maxLines: 1, // Limita el texto a una línea
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Aprende Lengua de Señas',
                        style: TextStyle(
                          fontSize: 14.sp, // Ajustar tamaño
                          color: Colors.white70,
                        ),
                        overflow:
                            TextOverflow.ellipsis, // Asegura que no se salga
                        maxLines: 1, // Limita el texto a una línea
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Lista de opciones
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.auto_stories,
                      color: Color(0xFF2F509D), size: 28.r),
                  title: Text(
                    "Curso gratuito",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text("Inicia gratis en INSOR"),
                  onTap: () =>
                      launch("https://educativo.insor.gov.co/diccionario/"),
                ),
                Divider(),
                ListTile(
                    leading: Icon(Icons.payment,
                        color: Color(0xFFF49F38), size: 28.r),
                    title: Text("Curso premium",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w600)),
                    subtitle: Text("Aprende con expertos en LSC"),
                    onTap: () => launch(
                        "https://lscolombiana.com/index.php/curso-lsc/")),
              ],
            ),
          ),

          // Mensaje final decorativo
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Text(
              "Invierte en tu aprendizaje, la lengua de señas abre nuevas puertas 🌟",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
