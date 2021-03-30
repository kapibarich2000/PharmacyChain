﻿Процедура ПроверитьНаличиеТовараПередВыполнением(ТочкаМаршрутаБизнесПроцесса, Задача, Отказ)
	Если НЕ ЗначениеЗаполнено(НаличиеТовараНаСкладе) Тогда
		Сообщить("Не выполнены действия, необходимые для выполнения задачи!", СтатусСообщения.Важное);
   	 	Отказ = Истина;
	КонецЕсли; 
КонецПроцедуры

Процедура РаспределитьПоставкуПередВыполнением(ТочкаМаршрутаБизнесПроцесса, Задача, Отказ)
	Если НЕ ЗначениеЗаполнено(Склад) Тогда
		Сообщить("Не выполнены действия, необходимые для выполнения задачи!", СтатусСообщения.Важное);
   	 	Отказ = Истина;
	КонецЕсли;
КонецПроцедуры

Процедура РаспечататьЗаявкуНаДоставкуПередВыполнением(ТочкаМаршрутаБизнесПроцесса, Задача, Отказ)
	ОсуществляетПоставку=ПараметрыСеанса.ТекущийПользователь;
КонецПроцедуры

Процедура ЗагрузитьТоварПередВыполнением(ТочкаМаршрутаБизнесПроцесса, Задача, Отказ)
	СостояниеПоставки=Перечисления.СостояниеПоставки.ТоварДоставляется;
	
	ДокументБизнесПроцесса=СсылкаДокументаПоставки.ПолучитьОбъект();
	ДокументБизнесПроцесса.СостояниеПоставки=СостояниеПоставки;
	ДокументБизнесПроцесса.Записать();
КонецПроцедуры

Процедура УказатьСостояниеПоставкиПередВыполнением(ТочкаМаршрутаБизнесПроцесса, Задача, Отказ)
	Если СостояниеПоставки=Перечисления.СостояниеПоставки.ТоварДоставляется ИЛИ
		СостояниеПоставки=Перечисления.СостояниеПоставки.ПоставкаНеОсущствлена Тогда
		Сообщить("Не выполнены действия, необходимые для выполнения задачи!", СтатусСообщения.Важное);
   	 	Отказ = Истина;
	КонецЕсли;
КонецПроцедуры

Процедура СостояниеПоставкиОбработкаВыбораВарианта(ТочкаВыбораВарианта, Результат)
	Если СостояниеПоставки=Перечисления.СостояниеПоставки.ПоставкаЦелая Тогда
		 Результат=ТочкаВыбораВарианта.Варианты.ПоставкаЦелая
	 ИначеЕсли СостояниеПоставки=Перечисления.СостояниеПоставки.БракованнаяПоставка Тогда
		 
		 Результат=ТочкаВыбораВарианта.Варианты.БракованнаяПоставка;
	 ИначеЕсли СостояниеПоставки=Перечисления.СостояниеПоставки.НеполнаяПоставка Тогда
		 
		 Результат=ТочкаВыбораВарианта.Варианты.НеполнаяПоставка;
	КонецЕсли
	
КонецПроцедуры

Процедура ПроведениеЗаписиДокументаПоставкиОбработка(ТочкаМаршрутаБизнесПроцесса)
	ДокументБизнесПроцесса=СсылкаДокументаПоставки.ПолучитьОбъект();
	ДокументБизнесПроцесса.ОсуществляетПоставку=ОсуществляетПоставку;
	ДокументБизнесПроцесса.СоСклада=Склад;
	ДокументБизнесПроцесса.ДатаПоставки=ТекущаяДата();
	ДокументБизнесПроцесса.СостояниеПоставки=СостояниеПоставки;
	
	ДокументБизнесПроцесса.Записать(РежимЗаписиДокумента.Проведение);
КонецПроцедуры

Процедура ОдобритьПоставкуПриВыполнении(ТочкаМаршрутаБизнесПроцесса, Задача, Отказ)
	ДокументПоставки=СсылкаДокументаПоставки.ПолучитьОбъект();

	ДокументПоставки.СостояниеПоставки=Перечисления.СостояниеПоставки.ПоставкаНеОсущствлена;
	ДокументПоставки.СсылкаНаБизнесПроцесс=Истина;
	
	ДокументПоставки.Записать(РежимЗаписиДокумента.Запись);
КонецПроцедуры
