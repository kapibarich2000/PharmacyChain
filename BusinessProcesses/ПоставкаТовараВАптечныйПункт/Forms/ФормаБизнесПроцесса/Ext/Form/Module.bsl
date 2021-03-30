﻿// Карта маршрута

&НаСервере
Процедура ОбновитьКартуМаршрута()	
	БизнесПроцессОбъект = РеквизитФормыВЗначение("Объект");
	КартаМаршрута=БизнесПроцессОбъект.ПолучитьКартуМаршрута();
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	 ОбновитьКартуМаршрута();
	 // или можно:
	 //КартаМаршрута=ТекущийОбъект.ПолучитьКартуМаршрута();	
 КонецПроцедуры
 
 
&НаКлиенте
Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)
	// Если потребовалось изменить состав поставки
	 //Если Элементы.Товары.ТолькоПросмотр=Ложь Тогда
	//	 ИзменениеСоставаПоставки();
	 //КонецЕсли;
 КонецПроцедуры


&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
	 ОбновитьКартуМаршрута();
	 Если Элементы.Товары.ТолькоПросмотр=Ложь Тогда
		 ИзменениеСоставаПоставки();
	 КонецЕсли;
КонецПроцедуры



// Изменение данных о поставленных товарах

&НаСервере
Процедура ИзменениеСоставаПоставки()
	
	ДокументПоставки=Объект.СсылкаДокументаПоставки.ПолучитьОбъект();
	    
	  // Удалить отсутствующие записи в плане первоначальной поставки
	  	  
	 Для Каждого СтрДанныхОРеальнойПоставке Из Объект.Товары Цикл
		 ТоварБылВПервоначальномДокументе=Ложь;
		 ЗаписьНаУдаление=Ложь;
		 
		 Если СтрДанныхОРеальнойПоставке.Количество=0 Тогда
		 	ЗаписьНаУдаление=Истина;
		 КонецЕсли;
		
		 Для Каждого СтрДанныхПоставкиИзДокумента Из ДокументПоставки.Товары Цикл
			 
			// Удаляем товар, которого нет в списки поставки
			 Если ЗаписьНаУдаление=Истина И СтрДанныхПоставкиИзДокумента.Товар=СтрДанныхОРеальнойПоставке.Наименование Тогда
				   ДокументПоставки.Товары.Удалить(СтрДанныхПоставкиИзДокумента);
				   Объект.Товары.Удалить(СтрДанныхОРеальнойПоставке);
			       ТоварБылВПервоначальномДокументе=Истина;
			// Изменяем количество товара в документе
			 ИначеЕсли  СтрДанныхПоставкиИзДокумента.Товар=СтрДанныхОРеальнойПоставке.Наименование Тогда
	    		   ТоварБылВПервоначальномДокументе=Истина;
				Если Не СтрДанныхПоставкиИзДокумента.Количество=СтрДанныхОРеальнойПоставке.Количество Тогда
	    			СтрДанныхПоставкиИзДокумента.Количество=СтрДанныхОРеальнойПоставке.Количество; // Меняем колличество товара			
	    		КонецЕсли;					
	    		Прервать;			
	    	КонецЕсли;
							
		КонецЦикла;// СтрДанныхПоставкиИзДокумента
			
			
			// Если был осуществлен привоз товара, которого не было в заявке
			Если ТоварБылВПервоначальномДокументе=Ложь Тогда  
				НовыйТоварВСписке = ДокументПоставки.Товары.Добавить();
		    	НовыйТоварВСписке.Товар = СтрДанныхОРеальнойПоставке.Наименование;
		    	НовыйТоварВСписке.Количество = СтрДанныхОРеальнойПоставке.Количество;
			КонецЕсли;
			
	  КонецЦикла;//  СтрДанныхОРеальнойПоставке
	  
	  ДокументПоставки.Записать(РежимЗаписиДокумента.Запись);
	
КонецПроцедуры


&НаСервере
Функция проверитьНеобходимостьИзмененияСоставаПоставки(СостояниеПоставки)
	Если Объект.СостояниеПоставки=Перечисления.СостояниеПоставки.БракованнаяПоставка ИЛИ
	Объект.СостояниеПоставки=Перечисления.СостояниеПоставки.НеполнаяПоставка Тогда
		 Возврат Истина;
	Иначе
		 Возврат Ложь;
	КонецЕсли;
КонецФункции


&НаКлиенте
Процедура СостояниеПоставкиПриИзменении(Элемент)
	Если проверитьНеобходимостьИзмененияСоставаПоставки(Объект.СостояниеПоставки)= Истина Тогда
		Сообщить("Измените состав поставки");
		Элементы.Товары.ТолькоПросмотр=Ложь;
		Элементы.КнопкиТаблицыТовары.Видимость=Истина;
	Иначе
		Элементы.Товары.ТолькоПросмотр=Истина;
		Элементы.КнопкиТаблицыТовары.Видимость=Ложь;
	КонецЕсли;
КонецПроцедуры
