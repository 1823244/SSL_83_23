﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Параметры.Свойство("АвтоТест") Тогда // Возврат при получении формы для анализа.
		Возврат;
	КонецЕсли;
	
	ЗаполнитьЗначенияСвойств(ЭтотОбъект,Параметры);
	Если ТипСтрокиДерева = "Раздел" Тогда
		
		Элементы.Обязательный.Видимость             = Ложь;
		Элементы.ЭлементарныйВопрос.Видимость       = Ложь;
		Элементы.ГруппаПодсказка.Видимость          = Ложь;
		Элементы.Формулировка.Заголовок             = НСтр("ru = 'Имя раздела'");
		Заголовок                                   = НСтр("ru = 'Раздел шаблона анкеты'");
		
	КонецЕсли;
	
	Если НЕ ЭлементарныйВопрос.Пустая() Тогда
		Элементы.Формулировка.СписокВыбора.Добавить(ОбщегоНазначения.ЗначениеРеквизитаОбъекта(ЭлементарныйВопрос,"Формулировка"));
	КонецЕсли;
	
	Если ТипВопроса = Перечисления.ТипыВопросовШаблонаАнкеты.ВопросСУсловием Тогда
		ПараметрыВыбора = Новый Массив;
		ПараметрыВыбора.Добавить(Новый ПараметрВыбора("Отбор.ТипОтвета",ПредопределенноеЗначение("Перечисление.ТипыОтветовНаВопрос.Булево")));
		Элементы.ЭлементарныйВопрос.ПараметрыВыбора = Новый ФиксированныйМассив(ПараметрыВыбора);
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПриЗакрытии(ЗавершениеРаботы)
	
	Если Не ВыполняетсяЗакрытие И ЭтоНоваяСтрока Тогда
		Оповестить("ОтменаВводаНовойСтрокиШаблонаАнкеты");
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ЭлементарныйВопросОбработкаВыбора(Элемент, ВыбранноеЗначение, СтандартнаяОбработка)
	
	РеквизитыВопрос = РеквизитыВопроса(ВыбранноеЗначение);
	
	СформироватьАвтоФормулировку(РеквизитыВопрос.Формулировка);
	
КонецПроцедуры

&НаКлиенте
Процедура ЗаметкиНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	ОповещениеОЗакрытии = Новый ОписаниеОповещения("РедактированиеЗаметкиПриЗакрытии", ЭтотОбъект);
	ОбщегоНазначенияКлиент.ПоказатьФормуРедактированияМногострочногоТекста(ОповещениеОЗакрытии, Элемент.ТекстРедактирования, НСтр("ru = 'Заметки'"));

КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ПеренестиВШаблон(Команда)
	
	Отказ = Ложь;
	
	Если Не ЗначениеЗаполнено(Формулировка) Тогда
		Отказ = Истина;
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(НСтр("ru = 'Не заполнена формулировка'"),,"Формулировка");
	КонецЕсли;
	
	Если ТипСтрокиДерева = "Вопрос" И (Не ЗначениеЗаполнено(ЭлементарныйВопрос)) Тогда
		Отказ = Истина;
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(НСтр("ru = 'Не указан элементарный вопрос'"),,"ЭлементарныйВопрос");
	КонецЕсли; 
		
	Если Отказ Тогда
		Возврат;
	КонецЕсли;
	
	ВыполняетсяЗакрытие = Истина;
	Оповестить("ОкончаниеРедактированияПараметровСтрокиШаблонаАнкеты",СформироватьСтруктуруПараметровДляПередачиВладельцу());
	Закрыть();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Формирует структуру параметров для передачи в форму владельца.
&НаКлиенте
Функция СформироватьСтруктуруПараметровДляПередачиВладельцу()

	СтруктураВозврата = Новый Структура;
	СтруктураВозврата.Вставить("Обязательный", Обязательный);
	СтруктураВозврата.Вставить("Формулировка", Формулировка);
	СтруктураВозврата.Вставить("ЭлементарныйВопрос", ЭлементарныйВопрос);
	СтруктураВозврата.Вставить("Заметки", Заметки);
	СтруктураВозврата.Вставить("ЭтоНоваяСтрока", Ложь);
	СтруктураВозврата.Вставить("Подсказка", Подсказка);
	СтруктураВозврата.Вставить("СпособОтображенияПодсказки", СпособОтображенияПодсказки);
	
	Возврат СтруктураВозврата;

КонецФункции

// Получает значение формулировки элементарного вопроса и заполняет список выбора поля Формулировка.
&НаКлиенте
Функция СформироватьАвтоФормулировку(ФормулировкаЭлементарногоВопроса)

	Элементы.Формулировка.СписокВыбора.Очистить();
	
	Если ПустаяСтрока(Формулировка) Тогда
		Формулировка = ФормулировкаЭлементарногоВопроса;
	КонецЕсли;
	
	Элементы.Формулировка.СписокВыбора.Добавить(ФормулировкаЭлементарногоВопроса);
	
	Возврат ФормулировкаЭлементарногоВопроса;

КонецФункции

&НаСервере
Функция РеквизитыВопроса(Вопрос)
	
	Возврат ОбщегоНазначения.ЗначенияРеквизитовОбъекта(Вопрос,"ЭтоГруппа,ТипОтвета,Формулировка");
	
КонецФункции

&НаКлиенте
Процедура РедактированиеЗаметкиПриЗакрытии(ТекстВозврата, ДополнительныеПараметры) Экспорт
	
	Если Заметки <> ТекстВозврата Тогда
		Заметки = ТекстВозврата;
		Модифицированность = Истина;
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти
