import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  void _formatDatesAndSubmit() {
    final value = double.tryParse(valueController.text) ?? 0.0;
    final title = titleController.text;

    if (title.isEmpty || value == 0.0) {
      return;
    }

    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => _formatDatesAndSubmit(),
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
              onSubmitted: (_) => _formatDatesAndSubmit(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  const Text('Nenhuma data selecionada!'),
                  TextButton(
                    child: const Text(
                      'Selecionar Data',
                      style: TextStyle(color: Colors.purple),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5),
                  ),
                  child: Text(
                    'Nova Transação',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.button!.color,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _formatDatesAndSubmit,
                  onLongPress: () {
                    print("OI");
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
