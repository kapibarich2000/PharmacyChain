﻿&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Дата=ТекущаяДата();
КонецПроцедуры

&НаКлиенте
Процедура Отделения(Команда)
	ОткрытьФорму("Справочник.СписокОтделений.Форма.ФормаСписка");
КонецПроцедуры

&НаКлиенте
Процедура ПоставкиНаСклад(Команда)
	ОткрытьФорму("Задача.ЗадачиПоставкиНаСклад.Форма.МоиЗадачи");
КонецПроцедуры

&НаКлиенте
Процедура ПставкиВАптечныеПункты(Команда)
	ОткрытьФорму("Задача.ЗадачиПоставкиВАптечныеПункты.Форма.МоиЗадачи");
КонецПроцедуры


&НаКлиенте
Процедура СписокТоваров(Команда)
	ОткрытьФорму("Справочник.Товары.Форма.ФормаГруппы");
КонецПроцедуры

