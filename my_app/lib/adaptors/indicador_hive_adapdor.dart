import 'package:hive/hive.dart';
import '/models/indicador.dart';

class IndicadorHiveAdapter extends TypeAdapter<Indicador> {
  @override
  final typeId = 1;

  @override
  Indicador read(BinaryReader reader) {
    return Indicador(
      bicho: reader.readString(),
      descricao: reader.readString(),
      meta: reader.readDouble(),
      icone: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Indicador obj) {
    writer.writeString(obj.bicho);
    writer.writeString(obj.descricao);
    writer.writeDouble(obj.meta);
    writer.writeString(obj.icone);
  }
}