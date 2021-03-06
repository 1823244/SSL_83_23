﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Если НЕ ОценкаПроизводительностиСлужебный.ПодсистемаСуществует("СтандартныеПодсистемы.БазоваяФункциональность") Тогда
		ЭтаФорма.Элементы.КаталогЭкспорта.КнопкаВыбора = Ложь;
		ЕстьБСП = Ложь;
	Иначе
		ЕстьБСП = Истина;
	КонецЕсли;
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ВыбратьКаталогЭкспортаПредложено(РасширениеРаботыСФайламиПодключено, ДополнительныеПараметры) Экспорт
	
	Если РасширениеРаботыСФайламиПодключено Тогда
		
		ВыборФайла = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.ВыборКаталога);
		ВыборФайла.МножественныйВыбор = Ложь;
		ВыборФайла.Заголовок = НСтр("ru = 'Выбор каталога экспорта'");
		
		Если ВыборФайла.Выбрать() Тогда
			ЭтаФорма.КаталогЭкспорта = ВыборФайла.Каталог;
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура КаталогЭкспортаНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	Если ЕстьБСП Тогда
		ОписаниеОповещения = Новый ОписаниеОповещения("ВыбратьКаталогЭкспортаПредложено", ЭтотОбъект);
		МодульОбщегоНазначения = Вычислить("ОбщегоНазначенияКлиент");
		Если ТипЗнч(МодульОбщегоНазначения) = Тип("ОбщийМодуль") Тогда
			МодульОбщегоНазначения.ПоказатьВопросОбУстановкеРасширенияРаботыСФайлами(ОписаниеОповещения);
		КонецЕсли;
	КонецЕсли;
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ВыполнитьЭкспорт(Команда)
	
	ЕстьОшибки = Ложь;
	
	Если НЕ ЗначениеЗаполнено(ДатаНачалаПериодаЭкспорта) Тогда
		
		СообщениеПользователю = Новый СообщениеПользователю;
		СообщениеПользователю.Поле = "ДатаНачалаПериодаЭкспорта";
		СообщениеПользователю.Текст = НСтр("ru = 'Значение параметра ""Дата начала"" не заполнено.
		|Экспорт невозможен.'");
		СообщениеПользователю.Сообщить();
		
		ЕстьОшибки = Истина;
		
	КонецЕсли;
	
	Если НЕ ЗначениеЗаполнено(ДатаОкончанияПериодаЭкспорта) Тогда
		
		СообщениеПользователю = Новый СообщениеПользователю;
		СообщениеПользователю.Поле = "ДатаОкончанияПериодаЭкспорта";
		СообщениеПользователю.Текст = НСтр("ru = 'Значение параметра ""Дата окончания"" не заполнено.
		|Экспорт невозможен.'");
		СообщениеПользователю.Сообщить();
		
		ЕстьОшибки = Истина;
		
	КонецЕсли;
	
	Если НЕ ЗначениеЗаполнено(КаталогЭкспорта) Тогда
		
		СообщениеПользователю = Новый СообщениеПользователю;
		СообщениеПользователю.Поле = "КаталогЭкспорта";
		СообщениеПользователю.Текст = НСтр("ru = 'Значение параметра ""Каталог экспорта"" не заполнено.
		|Экспорт невозможен.'");
		СообщениеПользователю.Сообщить();
		
		ЕстьОшибки = Истина;
		
	КонецЕсли;
	
	Если НЕ ЗначениеЗаполнено(ИмяАрхива) Тогда
		
		СообщениеПользователю = Новый СообщениеПользователю;
		СообщениеПользователю.Поле = "ИмяАрхива";
		СообщениеПользователю.Текст = НСтр("ru = 'Значение параметра ""Имя архива"" не заполнено.
		|Экспорт невозможен.'");
		СообщениеПользователю.Сообщить();
		
		ЕстьОшибки = Истина;
		
	КонецЕсли;
	
	Если ЗначениеЗаполнено(ДатаНачалаПериодаЭкспорта) И ЗначениеЗаполнено(ДатаОкончанияПериодаЭкспорта) И ДатаНачалаПериодаЭкспорта >= ДатаОкончанияПериодаЭкспорта Тогда
		
		СообщениеПользователю = Новый СообщениеПользователю;
		СообщениеПользователю.Поле = "ДатаНачалаПериодаЭкспорта";
		СообщениеПользователю.Текст = НСтр("ru = 'Значение параметра ""Дата начала"" больше или равно значения параметры ""Дата окончания"".
		|Экспорт невозможен.'");
		СообщениеПользователю.Сообщить();
		
		ЕстьОшибки = Истина;
		
	КонецЕсли;
	
	Если ЕстьОшибки Тогда
		Возврат;
	КонецЕсли;
	
	АдресХранилища = ПоместитьВоВременноеХранилище(Неопределено, ЭтаФорма.УникальныйИдентификатор);
	ПараметрыЭкспорта = Новый Структура;
	ПараметрыЭкспорта.Вставить("ДатаНачала", ЭтаФорма.ДатаНачалаПериодаЭкспорта);
	ПараметрыЭкспорта.Вставить("ДатаОкончания", ЭтаФорма.ДатаОкончанияПериодаЭкспорта);
	ПараметрыЭкспорта.Вставить("АдресХранилища", АдресХранилища);
	ВыполнитьЭкспортНаСервере(ПараметрыЭкспорта);
	
	ДвоичныеДанные = ПолучитьИзВременногоХранилища(АдресХранилища);
	УдалитьИзВременногоХранилища(АдресХранилища);
	ДвоичныеДанные.Записать(ЭтаФорма.КаталогЭкспорта + ПолучитьРазделительПутиКлиента() + ЭтаФорма.ИмяАрхива + ".zip");
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервереБезКонтекста
Процедура ВыполнитьЭкспортНаСервере(Параметры)
	ОценкаПроизводительности.ЭкспортОценкиПроизводительности(Неопределено, Параметры);	
КонецПроцедуры

#КонецОбласти