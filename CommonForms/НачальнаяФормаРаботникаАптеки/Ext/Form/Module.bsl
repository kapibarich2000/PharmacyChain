﻿
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Дата=ТекущаяДата();
КонецПроцедуры

&НаКлиенте
Процедура ВладельцыКлубныхКарт(Команда)
	ОткрытьФорму("Справочник.ВладельцыКлубныхКарт.Форма.ФормаСписка");
КонецПроцедуры

&НаКлиенте
Процедура ЗадачиАптечнымПунктам(Команда)
	ОткрытьФорму("Задача.ЗадачиАптечнымПунктам.Форма.ФормаЗадач");
КонецПроцедуры

&НаКлиенте
Процедура ЗадачиПоставкиВАптечныйПункт(Команда)
	ОткрытьФорму("Задача.ЗадачиПоставкиВАптечныеПункты.Форма.МоиЗадачи");
КонецПроцедуры

&НаКлиенте
Процедура ОстаткиТоваровВАптечномПункте(Команда)
	ОткрытьФорму("Отчет.ОстаткиТовараВАптечномПункте.Форма.ФормаОтчета");
КонецПроцедуры

&НаКлиенте
Процедура ПоставкаВПункты(Команда)
	ОткрытьФорму("Документ.ПоставкаВПункты.Форма.ФормаСписка");
КонецПроцедуры

&НаКлиенте
Процедура ПрайсЛист(Команда)
	ОткрытьФорму("Отчет.ПрайсЛист.Форма.ФормаОтчета");
КонецПроцедуры

&НаКлиенте
Процедура Продажа(Команда)
	ОткрытьФорму("Документ.СписокПродаж.Форма.ФормаДокумента");
КонецПроцедуры

&НаКлиенте
Процедура ЗаказыКлиентов(Команда)
	ОткрытьФорму("Документ.ЗаказыКлиента.Форма.ФормаСписка");
КонецПроцедуры
