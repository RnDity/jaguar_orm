part of query.compose;

String composeUpsert(final Upsert st) {
  final ImmutableUpsertStatement info = st.asImmutable;
  final sb = new StringBuffer();

  sb.write('INSERT OR REPLACE INTO ');
  //sb.write('INSERT INTO ');
  sb.write(info.table);
  sb.write('(');

  sb.write(info.values.keys.join(', '));

  sb.write(') VALUES (');
  sb.write(info.values.values.map(composeValue).join(', '));
  sb.write(')');
  /*sb.write('ON CONFLICT (');
  sb.write(info.values.keys.first);
  sb.write(') DO UPDATE SET ');
  sb.write(info.values.keys
      .map((String key) => '$key=${composeValue(info.values[key])}')
      .join(', '));*/
  sb.write(';');

  return sb.toString();
}
