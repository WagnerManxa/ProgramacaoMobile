import 'package:hive/hive.dart';
import '/models/vendedor.dart';

class VendedorHiveAdapter extends TypeAdapter<Vendedor> {
  @override
  final typeId = 0;

  @override
  Vendedor read(BinaryReader reader) {
    return Vendedor(
      nome: reader.readString(),
      sobrenome: reader.readString(),
      matricula: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Vendedor obj) {
    writer.writeString(obj.nome);
    writer.writeString(obj.sobrenome);
    writer.writeInt(obj.matricula);
  }
}