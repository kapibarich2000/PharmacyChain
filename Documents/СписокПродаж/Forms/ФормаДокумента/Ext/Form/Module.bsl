﻿&НаКлиенте
Процедура КорзинаКоличествоПриИзменении(Элемент)
	СтрокаТабличнойЧасти=Элементы.Корзина.ТекущиеДанные;
	Отделение=Строка(Объект.АптечныйПункт);
	ФункцииДляРаботыСДокументами.РассчитатьСуммуПродажа(СтрокаТабличнойЧасти,Отделение);
КонецПроцедуры

&НаКлиенте
Процедура КорзинаЦенаПриИзменении(Элемент)
	СтрокаТабличнойЧасти=Элементы.Корзина.ТекущиеДанные;
	Отделение=Строка(Объект.АптечныйПункт);
	ФункцииДляРаботыСДокументами.РассчитатьСуммуПродажа(СтрокаТабличнойЧасти,Отделение);
КонецПроцедуры

&НаКлиенте
Процедура КорзинаТоварПриИзменении(Элемент)
	СтрокаТабличнойЧасти=Элементы.Корзина.ТекущиеДанные;
	СтрокаТабличнойЧасти.Цена=СерверныеФункции.РозничнаяЦена(Объект.Дата, СтрокаТабличнойЧасти.Товар);
	ФункцииДляРаботыСДокументами.РассчитатьСуммуПродажа(СтрокаТабличнойЧасти);	
КонецПроцедуры
