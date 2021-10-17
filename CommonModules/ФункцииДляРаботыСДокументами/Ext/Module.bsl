﻿Процедура РассчитатьСуммуСклад(СтрокаТабличнойЧасти) Экспорт
	СтрокаТабличнойЧасти.Сумма= СтрокаТабличнойЧасти.Количество*
	СтрокаТабличнойЧасти.Цена;
КонецПроцедуры

Процедура РассчитатьСуммуПродажа(СтрокаТабличнойЧасти,Отделение) Экспорт
	КоэфИзмен=СерверныеФункции.ПолучитьКонстантуИзменЦены(Отделение);
	СтрокаТабличнойЧасти.Сумма=СтрокаТабличнойЧасти.Количество*
	СтрокаТабличнойЧасти.Цена*КоэфИзмен;
КонецПроцедуры

Процедура РассчитатьСуммуПродажаЗаказ(СтрокаТабличнойЧасти) Экспорт
	СтрокаТабличнойЧасти.Сумма=СтрокаТабличнойЧасти.Количество*
	СтрокаТабличнойЧасти.Цена;
КонецПроцедуры
