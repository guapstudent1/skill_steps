import 'package:flutter/material.dart';
class MyRoute extends StatelessWidget{
  final int step;
  final Function onNext;
  MyRoute({key, this.step, this.onNext});

  final List<String> _headText = [
    "Более 100\nпрофессиональных\nи проверенных\nмастеров",
    "Стоимость работы\nрассчитывает\nприложение мастера",
    "Самая низкая цена\nбез потери качества",
    "Например: замена 2-х\nсмесителей",
    "Следите за мастером\nна карте"
  ];
  final List<String> _descText = [
    "Мастер свяжется с вами\nв течении 20 минут",
    "Вы можете выбрать почасовой\nили договорной способ оплаты",
    "От 300 рублей за час\nили мелкую работу",
    "Обычно: 1000-1500 руб.\nУ нас: 500-700 руб. с выездом\nи покупкой материалов",
    "Вы знаете, где ваш мастер и когда\nон приедет в нужный день"
  ];
  Widget _stepRectangle(int edge, int index)
  {
    final double pad = 5.0;
    return Container(
      width: 18.7,
      height: 4.7,
      margin: (edge==0? EdgeInsets.only(right:pad):
      edge==1? EdgeInsets.symmetric(horizontal:pad):
      EdgeInsets.only(left:pad)),
      child: Container(
        decoration: new BoxDecoration(
          color: step==index? Colors.blue: Colors.grey,
          shape: BoxShape.rectangle ,
          borderRadius: BorderRadius.all(Radius.circular(1.7)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final ButtonStyle styleButton =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),
        padding: EdgeInsets.symmetric(horizontal: 80.0));

    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.white,
        child:Column(
          children: <Widget>[
            MyStep(
            headText: _headText[step],
                descText: _descText[step],
                step: step
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _stepRectangle(0, 0),
                  _stepRectangle(1, 1),
                  _stepRectangle(1, 2),
                  _stepRectangle(1, 3),
                  _stepRectangle(2, 4),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 2.0, top: 10.0),
                child: ElevatedButton(
                    child: Text('Дальше'),
                    style: styleButton,
                    onPressed: () {onNext(step);},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: TextButton(
                  child: Text('Пропустить', style: TextStyle(color: Colors.grey)),
                  onPressed: () => null
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MyStep extends StatelessWidget{
  final String headText, descText;
  final int step;
  MyStep({key, this.headText, this.descText, this.step});

  @override
  Widget build(BuildContext context)
  {
    final TextStyle styleHead = TextStyle(fontSize: 15.0, color: Colors.blue);
    final TextStyle styleDesc = TextStyle(fontSize: 10.0, color: Colors.black);
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(15.0),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 210,
                child: Image(image: AssetImage("domspas/step${step+1}.png")),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(headText,
                  style: styleHead,
                  textAlign: TextAlign.center,
                  //textDirection: TextDirection.ltr,
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text(descText,
                    style: styleDesc,
                    textAlign: TextAlign.center,
                  )
              ),

            ]
        ),
      ),
    );
  }
}