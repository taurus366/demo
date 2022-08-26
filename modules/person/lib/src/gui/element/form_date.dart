part of person.gui;

class DateCell extends cl_form.RowDataCell<DateTime?> {
  bool hours;
  DateCell(grid, row, cell, object, { this.hours = false })
      : super(grid, row, cell,
            object == null || object.isEmpty ?
            null : DateTime.tryParse(object));

  void render() {
    final eval = hours ? 'dd.MM.yyyy hh:mm:ss' : 'dd.MM.yyyy';
    if (object != null)
      cell.text = '${DateFormat(eval).format(object!)}г.';
    else
      cell.text = '';
  }
}
