﻿////////////////////////////////////////////////////////////////////////////////
// Методы работы с СКД.
//
////////////////////////////////////////////////////////////////////////////////

#Область СлужебныйПрограммныйИнтерфейс

////////////////////////////////////////////////////////////////////////////////
// Клиентские события рассылок отчетов.

// Обработчик активизации строки пользовательской настройки СКД отчета.
//
// Параметры:
//   Отчет - ДанныеФормыЭлементКоллекции - Строка табличной части, описывающая отчет.
//       Свойства для чтения:
//         * ПолноеИмя - Строка - Полное имя отчета. Например: "Отчет.ИмяОтчета".
//         * КлючВарианта - Строка - Ключ варианта отчета.
//         * Отчет - СправочникСсылка.ВариантыОтчетов - Ссылка варианта отчета.
//         * Представление - Строка - Наименование варианта отчета.
//       Свойства для изменения:
//         * ВнесеныИзменения - Булево - Следует установить Истина когда меняются пользовательские настройки отчета.
//   КомпоновщикНастроекКД - КомпоновщикНастроекКомпоновкиДанных - Все настройки отчета.
//       Свойства для изменения:
//       * ПользовательскиеНастройки - ПользовательскиеНастройкиКомпоновкиДанных - Все пользовательские настройки отчета.
//       Все прочие свойства - только для чтения.
//   ИдентификаторКД - ИдентификаторКомпоновкиДанных - Идентификатор пользовательской настройки отчета.
//       Может использоваться для получения данных пользовательской настройки. Например:
//       	ПользовательскаяНастройкаКД = КомпоновщикНастроекКД.НайтиПоИдентификатору(ИдентификаторКД);
//   ТолькоПросмотрЗначения - Булево - Флажок возможности непосредственного редактирования колонки "Значение".
//       Если установить в Истина, то следует определить обработчик выбора значения в событии "ПриНачалеВыбораНастройки".
//
Процедура ПриАктивизацииСтрокиНастройки(Отчет, КомпоновщикНастроекКД, ИдентификаторКД, ТолькоПросмотрЗначения) Экспорт
	
КонецПроцедуры

// Обработчик начала выбора значения для строки пользовательской настройки СКД отчета.
//
// Параметры:
//   Отчет - ДанныеФормыЭлементКоллекции - Строка табличной части, описывающая отчет.
//       Свойства для чтения:
//         * ПолноеИмя - Строка - Полное имя отчета. Например: "Отчет.ИмяОтчета".
//         * КлючВарианта - Строка - Ключ варианта отчета.
//         * Отчет - СправочникСсылка.ВариантыОтчетов - Ссылка варианта отчета.
//         * Представление - Строка - Наименование варианта отчета.
//       Свойства для изменения:
//         * ВнесеныИзменения - Булево - Следует установить Истина когда меняются пользовательские настройки отчета.
//   КомпоновщикНастроекКД - КомпоновщикНастроекКомпоновкиДанных - Все настройки отчета.
//       Свойства для изменения:
//       * ПользовательскиеНастройки - ПользовательскиеНастройкиКомпоновкиДанных - Все пользовательские настройки отчета.
//       Все прочие свойства - только для чтения.
//   ИдентификаторКД - ИдентификаторКомпоновкиДанных - Идентификатор пользовательской настройки отчета.
//       Может использоваться для получения данных пользовательской настройки. Например:
//       	ПользовательскаяНастройкаКД = КомпоновщикНастроекКД.НайтиПоИдентификатору(ИдентификаторКД);
//   СтандартнаяОбработка - Булево - Если Истина, то будет использован стандартный диалог выбора.
//       Если используется собственная обработка события, то следует установить в Ложь.
//   ОбработчикРезультата - Обработчик результата выбора прикладной формы.
//       В качестве результата в ОбработчикРезультата могут быть переданы значения типов:
//       Неопределено - Пользователь отказался от выбора.
//       ПользовательскиеНастройкиКомпоновкиДанных - Новые настройки отчета.
//
Процедура ПриНачалеВыбораНастройки(Отчет, КомпоновщикНастроекКД, ИдентификаторКД, СтандартнаяОбработка, Обработчик) Экспорт
	
КонецПроцедуры

// Обработчик очистки значения для строки пользовательской настройки СКД отчета.
//
// Параметры:
//   Отчет - ДанныеФормыЭлементКоллекции - Строка табличной части, описывающая отчет.
//       Свойства для чтения:
//         * ПолноеИмя - Строка - Полное имя отчета. Например: "Отчет.ИмяОтчета".
//         * КлючВарианта - Строка - Ключ варианта отчета.
//         * Отчет - СправочникСсылка.ВариантыОтчетов - Ссылка варианта отчета.
//         * Представление - Строка - Наименование варианта отчета.
//       Свойства для изменения:
//         * ВнесеныИзменения - Булево - Следует установить Истина когда меняются пользовательские настройки отчета.
//   КомпоновщикНастроекКД - КомпоновщикНастроекКомпоновкиДанных - Все настройки отчета.
//       Свойства для изменения:
//       * ПользовательскиеНастройки - ПользовательскиеНастройкиКомпоновкиДанных - Все пользовательские настройки отчета.
//       Все прочие свойства - только для чтения.
//   ИдентификаторКД - ИдентификаторКомпоновкиДанных - Идентификатор пользовательской настройки отчета.
//       Может использоваться для получения данных пользовательской настройки. Например:
//       	ПользовательскаяНастройкаКД = КомпоновщикНастроекКД.НайтиПоИдентификатору(ИдентификаторКД);
//   СтандартнаяОбработка - Булево - Если Истина, то значение настройки будет очищено.
//       Если значение настройки не должно быть очищено, то следует установить в Ложь.
//
Процедура ПриОчисткеНастройки(Отчет, КомпоновщикНастроекКД, ИдентификаторКД, СтандартнаяОбработка) Экспорт
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

////////////////////////////////////////////////////////////////////////////////
// Методы работы с СКД из формы отчета.

Функция ПараметрыВыбораОтбора(Форма, Элемент) Экспорт
	ИдентификаторЭлемента = Прав(Элемент.Имя, 32);
	
	ЭлементКД = Форма.НайтиПользовательскуюНастройкуЭлемента(ИдентификаторЭлемента);
	Если ЭлементКД = Неопределено Тогда
		Возврат Неопределено;
	КонецЕсли;
	ДополнительныеНастройки = Форма.НайтиДополнительныеНастройкиЭлемента(ИдентификаторЭлемента);
	Если ДополнительныеНастройки = Неопределено Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	Результат = Новый Структура("Представление, ЗначенияДляВыбора, БыстрыйВыбор, ОграничиватьВыборУказаннымиЗначениями, ОписаниеТипов, ВводСписком");
	ЗаполнитьЗначенияСвойств(Результат, ДополнительныеНастройки);
	
	Если ТипЗнч(ЭлементКД) = Тип("ЭлементОтбораКомпоновкиДанных") Тогда
		Значение = ЭлементКД.ПравоеЗначение;
		Условие  = ЭлементКД.ВидСравнения;
	Иначе
		Значение = ЭлементКД.Значение;
		Условие  = ?(Результат.ВводСписком, ВидСравненияКомпоновкиДанных.ВСписке, ВидСравненияКомпоновкиДанных.Равно);
	КонецЕсли;
	
	ВыборГруппИЭлементов = ОтчетыКлиентСервер.ПривестиЗначениеКТипуГруппыИЭлементы(Условие, ДополнительныеНастройки.ВыборГруппИЭлементов);
	
	// Стандартные параметры формы.
	Результат.Вставить("ЗакрыватьПриВыборе",            Истина);
	Результат.Вставить("ЗакрыватьПриЗакрытииВладельца", Истина);
	Результат.Вставить("Отбор",                         Новый Структура);
	// Стандартные параметры формы выбора (см. Расширение управляемой формы для динамического списка).
	Результат.Вставить("ВыборГруппИЭлементов",          ВыборГруппИЭлементов);
	Результат.Вставить("МножественныйВыбор",            Ложь);
	Результат.Вставить("РежимВыбора",                   Истина);
	// Предполагаемые реквизиты.
	Результат.Вставить("РежимОткрытияОкна",             РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);
	Результат.Вставить("РазрешитьНачалоПеретаскивания", Ложь);
	
	Результат.Вставить("ПутьКФорме", ДополнительныеНастройки.ФормаВыбора);
	
	Результат.Вставить("Значение",   Значение);
	Результат.Вставить("Отмеченные", ОтчетыКлиентСервер.ЗначенияСписком(Значение));
	Результат.Вставить("ПараметрыВыбора", Новый Массив);
	Результат.Вставить("КлючУникальности", ИдентификаторЭлемента);
	
	// Фиксированные параметры выбора и связи от скрытых ведущих (предопределенные в текущем контексте).
	Для Каждого ПараметрВыбора Из ДополнительныеНастройки.ПараметрыВыбора Цикл
		Если ПустаяСтрока(ПараметрВыбора.Имя) Тогда
			Продолжить;
		КонецЕсли;
		Если Результат.ВводСписком Тогда
			Результат.ПараметрыВыбора.Добавить(ПараметрВыбора);
		Иначе
			Если ВРег(Лев(ПараметрВыбора.Имя, 6)) = ВРег("Отбор.") Тогда
				Результат.Отбор.Вставить(Сред(ПараметрВыбора.Имя, 7), ПараметрВыбора.Значение);
			Иначе
				Результат.Вставить(ПараметрВыбора.Имя, ПараметрВыбора.Значение);
			КонецЕсли;
		КонецЕсли;
	КонецЦикла;
	
	// Динамические связи от ведущих.
	Связи = Форма.ОтключаемыеСвязи.НайтиСтроки(Новый Структура("ПодчиненныйИдентификаторВФорме", ИдентификаторЭлемента));
	Для Каждого Связь Из Связи Цикл
		Если Не ЗначениеЗаполнено(Связь.ВедущийИдентификаторВФорме) Тогда
			Продолжить;
		КонецЕсли;
		ВедущийНастройкаКД = Форма.НайтиПользовательскуюНастройкуЭлемента(Связь.ВедущийИдентификаторВФорме);
		Если Не ВедущийНастройкаКД.Использование Тогда
			Продолжить;
		КонецЕсли;
		Если ТипЗнч(ВедущийНастройкаКД) = Тип("ЭлементОтбораКомпоновкиДанных") Тогда
			ЗначениеВедущего = ВедущийНастройкаКД.ПравоеЗначение;
			УсловиеВедущего  = ВедущийНастройкаКД.ВидСравнения;
		Иначе
			ЗначениеВедущего = ВедущийНастройкаКД.Значение;
			ДополнительноВедущего = Форма.НайтиДополнительныеНастройкиЭлемента(Связь.ВедущийИдентификаторВФорме);
			Если ДополнительноВедущего.ВводСписком Тогда
				УсловиеВедущего = ВидСравненияКомпоновкиДанных.ВСписке;
			Иначе
				УсловиеВедущего = ВидСравненияКомпоновкиДанных.Равно;
			КонецЕсли;
		КонецЕсли;
		Если Не ЗначениеЗаполнено(ЗначениеВедущего) Тогда
			Продолжить;
		КонецЕсли;
		ТипЗначенияВедущего = ТипЗнч(ЗначениеВедущего);
		
		Если Связь.ТипСвязи = "ПоТипу" Тогда
			Если УсловиеВедущего <> ВидСравненияКомпоновкиДанных.Равно
				И УсловиеВедущего <> ВидСравненияКомпоновкиДанных.ВИерархии Тогда
				Продолжить;
			КонецЕсли;
			Если ТипЗнч(Связь.ПодчиненныйИмяПараметра) = Тип("Число") И Связь.ПодчиненныйИмяПараметра > 0 Тогда
				ТипСубконто = ВариантыОтчетовВызовСервера.ТипСубконто(ЗначениеВедущего, Связь.ПодчиненныйИмяПараметра);
				Если ТипЗнч(ТипСубконто) = Тип("ОписаниеТипов") Тогда
					ФильтрПоТипам = ТипСубконто.Типы();
				Иначе
					Продолжить;
				КонецЕсли;
			Иначе
				ФильтрПоТипам = Новый Массив;
				ФильтрПоТипам.Добавить(ТипЗначенияВедущего);
			КонецЕсли;
			ВычитаемыеТипы = Результат.ОписаниеТипов.Типы();
			ОписанияТиповПересекаются = Ложь;
			Для Каждого ТипКоторыйНадоОставить Из ФильтрПоТипам Цикл
				Индекс = ВычитаемыеТипы.Найти(ТипКоторыйНадоОставить);
				Если Индекс <> Неопределено Тогда
					ВычитаемыеТипы.Удалить(Индекс);
					ОписанияТиповПересекаются = Истина;
				КонецЕсли;
			КонецЦикла;
			Если ОписанияТиповПересекаются Тогда
				Результат.ОписаниеТипов = Новый ОписаниеТипов(Результат.ОписаниеТипов, , ВычитаемыеТипы);
			КонецЕсли;
		ИначеЕсли Связь.ТипСвязи = "ПоМетаданным" Или Связь.ТипСвязи = "ПараметровВыбора" Тогда
			Если Не ЗначениеЗаполнено(Связь.ПодчиненныйИмяПараметра) Тогда
				Продолжить;
			КонецЕсли;
			Если Связь.ТипСвязи = "ПоМетаданным" И Не Связь.ВедущийТип.СодержитТип(ТипЗначенияВедущего) Тогда
				Продолжить;
			КонецЕсли;
			Если Результат.ВводСписком Тогда
				Результат.ПараметрыВыбора.Добавить(Новый ПараметрВыбора(Связь.ПодчиненныйИмяПараметра, ЗначениеВедущего));
			Иначе
				Если ВРег(Лев(Связь.ПодчиненныйИмяПараметра, 6)) = ВРег("Отбор.") Тогда
					Результат.Отбор.Вставить(Сред(Связь.ПодчиненныйИмяПараметра, 7), ЗначениеВедущего);
				Иначе
					Результат.Вставить(Связь.ПодчиненныйИмяПараметра, ЗначениеВедущего);
				КонецЕсли;
			КонецЕсли;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Результат;
КонецФункции

Процедура СписокКомпоновщикаНачалоВыбора(Форма, Элемент, ДанныеВыбора, СтандартнаяОбработка) Экспорт
	СтандартнаяОбработка = Ложь;
	
	ПараметрыФормы = ПараметрыВыбораОтбора(Форма, Элемент);
	Если ПараметрыФормы = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	ПараметрыОбработчика = Новый Структура;
	ПараметрыОбработчика.Вставить("Форма", Форма);
	ПараметрыОбработчика.Вставить("ИдентификаторЭлемента", Прав(Элемент.Имя, 32));
	Обработчик = Новый ОписаниеОповещения("СписокКомпоновщикаЗавершениеВыбора", ЭтотОбъект, ПараметрыОбработчика);
	
	Блокировать = РежимОткрытияОкнаФормы.БлокироватьОкноВладельца;
	
	ОткрытьФорму("ОбщаяФорма.ВводЗначенийСпискомСФлажками", ПараметрыФормы, ЭтотОбъект, , , , Обработчик, Блокировать);
КонецПроцедуры

Процедура СписокКомпоновщикаЗавершениеВыбора(РезультатВыбора, ПараметрыОбработчика) Экспорт
	Если ТипЗнч(РезультатВыбора) <> Тип("СписокЗначений") Тогда
		Возврат;
	КонецЕсли;
	Форма = ПараметрыОбработчика.Форма;
	
	ИдентификаторЭлемента = ПараметрыОбработчика.ИдентификаторЭлемента;
	
	ПользовательскаяНастройкаКД = Форма.НайтиПользовательскуюНастройкуЭлемента(ИдентификаторЭлемента);
	ДополнительныеНастройки = Форма.НайтиДополнительныеНастройкиЭлемента(ИдентификаторЭлемента);
	
	// Загрузка выбранных значений в 2 списка.
	СписокЗначенийВСКД = Новый СписокЗначений;
	Если Не ДополнительныеНастройки.ОграничиватьВыборУказаннымиЗначениями Тогда
		ДополнительныеНастройки.ЗначенияДляВыбора = Новый СписокЗначений;
	КонецЕсли;
	Для Каждого ЭлементСпискаВФорме Из РезультатВыбора Цикл
		ЗначениеВФорме = ЭлементСпискаВФорме.Значение;
		Если Не ДополнительныеНастройки.ОграничиватьВыборУказаннымиЗначениями Тогда
			Если ДополнительныеНастройки.ЗначенияДляВыбора.НайтиПоЗначению(ЗначениеВФорме) <> Неопределено Тогда
				Продолжить;
			КонецЕсли;
			ЗаполнитьЗначенияСвойств(ДополнительныеНастройки.ЗначенияДляВыбора.Добавить(), ЭлементСпискаВФорме, "Значение, Представление");
		КонецЕсли;
		Если ЭлементСпискаВФорме.Пометка Тогда
			ОтчетыКлиентСервер.ДобавитьУникальноеЗначениеВСписок(СписокЗначенийВСКД, ЗначениеВФорме, ЭлементСпискаВФорме.Представление, Истина);
		КонецЕсли;
	КонецЦикла;
	Если ТипЗнч(ПользовательскаяНастройкаКД) = Тип("ЭлементОтбораКомпоновкиДанных") Тогда
		ПользовательскаяНастройкаКД.ПравоеЗначение = СписокЗначенийВСКД;
	Иначе
		ПользовательскаяНастройкаКД.Значение = СписокЗначенийВСКД;
	КонецЕсли;
	
	// Включение флажка Использование.
	ПользовательскаяНастройкаКД.Использование = Истина;
	
	Форма.ПользовательскиеНастройкиМодифицированы = Истина;
	#Если ВебКлиент Тогда
		Форма.ОбновитьОтображениеДанных(); // Для платформы.
	#КонецЕсли
КонецПроцедуры

Процедура ИзменитьВидСравнения(Форма, ИдентификаторЭлемента, ОбработчикРезультата) Экспорт
	ПользовательскаяНастройкаКД = Форма.НайтиПользовательскуюНастройкуЭлемента(ИдентификаторЭлемента);
	Если ПользовательскаяНастройкаКД = Неопределено Тогда
		Возврат;
	КонецЕсли;
	ДополнительныеНастройки = Форма.НайтиДополнительныеНастройкиЭлемента(ИдентификаторЭлемента);
	Если ДополнительныеНастройки = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	ИнформацияОТипах = ОтчетыКлиентСервер.АнализТипов(ДополнительныеНастройки.ОписаниеТипов, Ложь);
	
	Список = Новый СписокЗначений;
	
	Если ИнформацияОТипах.ОграниченнойДлины Тогда
		
		Список.Добавить(ВидСравненияКомпоновкиДанных.Равно);
		Список.Добавить(ВидСравненияКомпоновкиДанных.НеРавно);
		
		Список.Добавить(ВидСравненияКомпоновкиДанных.ВСписке);
		Список.Добавить(ВидСравненияКомпоновкиДанных.НеВСписке);
		
		Если ИнформацияОТипах.СодержитОбъектныеТипы Тогда
			
			Список.Добавить(ВидСравненияКомпоновкиДанных.ВСпискеПоИерархии); // НСтр("ru = 'В списке включая подчиненные'")
			Список.Добавить(ВидСравненияКомпоновкиДанных.НеВСпискеПоИерархии); // НСтр("ru = 'Не в списке включая подчиненные'").
			
			Список.Добавить(ВидСравненияКомпоновкиДанных.ВИерархии); // НСтр("ru = 'В группе'")
			Список.Добавить(ВидСравненияКомпоновкиДанных.НеВИерархии); // НСтр("ru = 'Не в группе'")
			
		КонецЕсли;
		
		Если ИнформацияОТипах.КоличествоПримитивныхТипов > 0 Тогда
			
			Список.Добавить(ВидСравненияКомпоновкиДанных.Меньше);
			Список.Добавить(ВидСравненияКомпоновкиДанных.МеньшеИлиРавно);
			
			Список.Добавить(ВидСравненияКомпоновкиДанных.Больше);
			Список.Добавить(ВидСравненияКомпоновкиДанных.БольшеИлиРавно);
			
		КонецЕсли;
		
	КонецЕсли;
	
	Если ИнформацияОТипах.СодержитТипСтрока Тогда
		
		Список.Добавить(ВидСравненияКомпоновкиДанных.Содержит);
		Список.Добавить(ВидСравненияКомпоновкиДанных.НеСодержит);
		
		Список.Добавить(ВидСравненияКомпоновкиДанных.Подобно);
		Список.Добавить(ВидСравненияКомпоновкиДанных.НеПодобно);
		
		Список.Добавить(ВидСравненияКомпоновкиДанных.НачинаетсяС);
		Список.Добавить(ВидСравненияКомпоновкиДанных.НеНачинаетсяС);
		
	КонецЕсли;
	
	Если ИнформацияОТипах.ОграниченнойДлины Тогда
		
		Список.Добавить(ВидСравненияКомпоновкиДанных.Заполнено);
		Список.Добавить(ВидСравненияКомпоновкиДанных.НеЗаполнено);
		
	КонецЕсли;
	
	ТекущийЭлемент = Список.НайтиПоЗначению(ПользовательскаяНастройкаКД.ВидСравнения);
	
	Контекст = Новый Структура;
	Контекст.Вставить("Форма", Форма);
	Контекст.Вставить("ИдентификаторЭлемента", ИдентификаторЭлемента);
	Контекст.Вставить("ОбработчикРезультата", ОбработчикРезультата);
	
	Обработчик = Новый ОписаниеОповещения("ИзменитьВидСравненияЗавершение", ЭтотОбъект, Контекст);
	ФормаЗаголовок = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(НСтр("ru = 'Выберите условие отбора ""%1""'"), ДополнительныеНастройки.Представление);
	
	Список.ПоказатьВыборЭлемента(Обработчик, ФормаЗаголовок, ТекущийЭлемент);
КонецПроцедуры

Процедура ИзменитьВидСравненияЗавершение(ЭлементСписка, Контекст) Экспорт
	Если ЭлементСписка = Неопределено Тогда
		Результат = Неопределено;
	Иначе
		Результат = ЭлементСписка.Значение;
		ПользовательскаяНастройкаКД = Контекст.Форма.НайтиПользовательскуюНастройкуЭлемента(Контекст.ИдентификаторЭлемента);
		ПользовательскаяНастройкаКД.ВидСравнения = Результат;
	КонецЕсли;
	
	Если Контекст.ОбработчикРезультата <> Неопределено Тогда
		ВыполнитьОбработкуОповещения(Контекст.ОбработчикРезультата, Результат);
	КонецЕсли;
КонецПроцедуры

Процедура ЗначениеКомпоновщикаНачалоВыбора(Форма, Элемент, ДанныеВыбора, СтандартнаяОбработка) Экспорт
	СтандартнаяОбработка = Ложь;
	
	ПараметрыФормы = ПараметрыВыбораОтбора(Форма, Элемент);
	Если ПараметрыФормы = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	Анализ = ОтчетыКлиентСервер.АнализТипов(ПараметрыФормы.ОписаниеТипов, Ложь);
	Если Не Анализ.СодержитОбъектныеТипы Тогда
		СтандартнаяОбработка = Истина;
		Возврат;
	КонецЕсли;
	
	ПараметрыФормы.Вставить("МножественныйВыбор", Ложь);
	
	Контекст = Новый Структура;
	Контекст.Вставить("Форма",          Форма);
	Контекст.Вставить("Идентификатор",  Прав(Элемент.Имя, 32));
	Контекст.Вставить("ПараметрыФормы", ПараметрыФормы);
	
	Обработчик = Новый ОписаниеОповещения("ЗначениеКомпоновщикаПоказатьВыборСсылкиПослеВыбораТипа", ЭтотОбъект, Контекст);
	
	Блокировать = РежимОткрытияОкнаФормы.БлокироватьОкноВладельца;
	
	// Полное имя формы выбора.
	// Свойство "ФормаВыбора" недоступно на клиенте даже для чтения,
	//   поэтому для хранения предустановленных имен форм выбора используется коллекция БыстрыйПоискИменОбъектовМетаданных.
	Если ЗначениеЗаполнено(ПараметрыФормы.ПутьКФорме) Тогда
		ВыполнитьОбработкуОповещения(Обработчик, ПараметрыФормы.ПутьКФорме);
	Иначе
		// Выбор типа из списка.
		СписокВыбора = Новый СписокЗначений;
		СписокВыбора.ЗагрузитьЗначения(Анализ.ОбъектныеТипы);
		
		Если СписокВыбора.Количество() = 1 Тогда // Один тип - выбор не требуется.
			ВыполнитьОбработкуОповещения(Обработчик, СписокВыбора[0]);
		Иначе
			Форма.ПоказатьВыборИзСписка(Обработчик, СписокВыбора);
		КонецЕсли;
	КонецЕсли;
КонецПроцедуры

Процедура ЗначениеКомпоновщикаПоказатьВыборСсылкиПослеВыбораТипа(ПутьКФормеИлиЭлементСписка, Контекст) Экспорт
	Если ТипЗнч(ПутьКФормеИлиЭлементСписка) = Тип("Строка") Тогда
		ПутьКФорме = ПутьКФормеИлиЭлементСписка;
	ИначеЕсли ТипЗнч(ПутьКФормеИлиЭлементСписка) = Тип("ЭлементСпискаЗначений") Тогда
		Тип = ПутьКФормеИлиЭлементСписка.Значение;
		ИмяОбъектаМетаданных = Контекст.Форма.БыстрыйПоискИменОбъектовМетаданных.Получить(Тип);
		Если Контекст.ПараметрыФормы.ВыборГруппИЭлементов = ГруппыИЭлементы.Группы Тогда
			ВидОбъектаМетаданных = ВРег(СтрРазделить(ИмяОбъектаМетаданных, ".")[0]);
			Если ВидОбъектаМетаданных = "СПРАВОЧНИК" Или ВидОбъектаМетаданных = "ПЛАНВИДОВХАРАКТЕРИСТИК" Тогда
				ПутьКФорме = ИмяОбъектаМетаданных + ".ФормаВыбораГруппы";
			Иначе
				ПутьКФорме = ИмяОбъектаМетаданных + ".ФормаВыбора";
			КонецЕсли;
		Иначе
			ПутьКФорме = ИмяОбъектаМетаданных + ".ФормаВыбора";
		КонецЕсли;
	Иначе
		Возврат;
	КонецЕсли;
	
	Обработчик = Новый ОписаниеОповещения("ЗначениеКомпоновщикаЗавершениеВыбора", ЭтотОбъект, Контекст);
	
	Блокировать = РежимОткрытияОкнаФормы.БлокироватьОкноВладельца;
	
	ОткрытьФорму(ПутьКФорме, Контекст.ПараметрыФормы, ЭтотОбъект, , , , Обработчик, Блокировать);
КонецПроцедуры

Процедура ЗначениеКомпоновщикаЗавершениеВыбора(Ссылка, Контекст) Экспорт
	Если Не Контекст.ПараметрыФормы.ОписаниеТипов.СодержитТип(ТипЗнч(Ссылка)) Или Не ЗначениеЗаполнено(Ссылка) Тогда
		Возврат;
	КонецЕсли;
	
	Форма = Контекст.Форма;
	
	ЭлементКД = Форма.НайтиПользовательскуюНастройкуЭлемента(Контекст.Идентификатор);
	ДополнительныеНастройки = Форма.НайтиДополнительныеНастройкиЭлемента(Контекст.Идентификатор);
	
	Если ТипЗнч(ЭлементКД) = Тип("ЭлементОтбораКомпоновкиДанных") Тогда
		ЭлементКД.ПравоеЗначение = Ссылка;
	Иначе
		ЭлементКД.Значение = Ссылка;
	КонецЕсли;
	
	ЭлементКД.Использование = Истина; // Включение флажка.
	
	Форма.ПользовательскиеНастройкиМодифицированы = Истина;
	#Если ВебКлиент Тогда
		Форма.ОбновитьОтображениеДанных(); // Для платформы.
	#КонецЕсли
КонецПроцедуры

Процедура ВыбратьПериод(Форма, КнопкаВыбораИмя) Экспорт
	ЗначениеИмя = СтрЗаменить(КнопкаВыбораИмя, "_КнопкаВыбора_", "_Значение_");
	ИдентификаторЭлемента = Прав(КнопкаВыбораИмя, 32);
	
	Значение = Форма[ЗначениеИмя];
	
	Контекст = Новый Структура;
	Контекст.Вставить("Форма", Форма);
	Контекст.Вставить("ЗначениеИмя", ЗначениеИмя);
	Контекст.Вставить("ИдентификаторЭлемента", ИдентификаторЭлемента);
	Обработчик = Новый ОписаниеОповещения("ВыбратьПериодЗавершение", ЭтотОбъект, Контекст);
	
	СтандартнаяОбработка = Истина;
	ОтчетыКлиентПереопределяемый.ПриНажатииКнопкиВыбораПериода(Форма, Значение, СтандартнаяОбработка, Обработчик);
	Если Не СтандартнаяОбработка Тогда
		Возврат;
	КонецЕсли;
	
	Диалог = Новый ДиалогРедактированияСтандартногоПериода;
	Диалог.Период = Значение;
	Диалог.Показать(Обработчик);
КонецПроцедуры

Процедура ВыбратьПериодЗавершение(Период, Контекст) Экспорт
	Если ТипЗнч(Период) <> Тип("СтандартныйПериод") Тогда
		Возврат;
	КонецЕсли;
	
	Контекст.Форма[Контекст.ЗначениеИмя] = Период;
	
	ЭлементКД = Контекст.Форма.НайтиПользовательскуюНастройкуЭлемента(Контекст.ИдентификаторЭлемента);
	Если ТипЗнч(ЭлементКД) = Тип("ЭлементОтбораКомпоновкиДанных") Тогда
		ЭлементКД.ПравоеЗначение = Период;
	ИначеЕсли ТипЗнч(ЭлементКД) = Тип("ЗначениеПараметраНастроекКомпоновкиДанных") Тогда
		ЭлементКД.Значение = Период;
	КонецЕсли;
	ЭлементКД.Использование = Истина;
	
	Контекст.Форма.ПользовательскиеНастройкиМодифицированы = Истина;
	#Если ВебКлиент Тогда
		Контекст.Форма.ОбновитьОтображениеДанных(); // Для платформы.
	#КонецЕсли
КонецПроцедуры

Процедура ВыбратьЗначениеПримитивногоТипа(Форма, Тип, ОписаниеТипов, ТекущееЗначение, ПредставлениеПоля, ОбработчикРезультата) Экспорт
	ПараметрыОбработчика = Новый Структура("ОбработчикРезультата", ОбработчикРезультата);
	Обработчик = Новый ОписаниеОповещения("ПослеВыбораЗначенияПримитивногоТипа", ЭтотОбъект, ПараметрыОбработчика);
	СписокВыбора = Новый СписокЗначений;
	Если Тип = Тип("ВидДвиженияБухгалтерии") Тогда
		ОбщегоНазначенияКлиентСервер.ДополнитьМассив(СписокВыбора, ВидДвиженияБухгалтерии);
	ИначеЕсли Тип = Тип("ВидДвиженияНакопления") Тогда
		ОбщегоНазначенияКлиентСервер.ДополнитьМассив(СписокВыбора, ВидДвиженияНакопления);
	ИначеЕсли Тип = Тип("ВидПериодаРегистраРасчета") Тогда
		ОбщегоНазначенияКлиентСервер.ДополнитьМассив(СписокВыбора, ВидПериодаРегистраРасчета);
	ИначеЕсли Тип = Тип("ВидСчета") Тогда
		ОбщегоНазначенияКлиентСервер.ДополнитьМассив(СписокВыбора, ВидСчета);
	ИначеЕсли Тип = Тип("ВидТочкиМаршрутаБизнесПроцесса") Тогда
		ОбщегоНазначенияКлиентСервер.ДополнитьМассив(СписокВыбора, ВидТочкиМаршрутаБизнесПроцесса);
	ИначеЕсли Тип = Тип("Число") Тогда
		ПоказатьВводЧисла(
			Обработчик,
			ТекущееЗначение,
			ПредставлениеПоля,
			ОписаниеТипов.КвалификаторыЧисла.Разрядность,
			ОписаниеТипов.КвалификаторыЧисла.РазрядностьДробнойЧасти);
		Возврат;
	ИначеЕсли Тип = Тип("Строка") Тогда
		ПоказатьВводСтроки(
			Обработчик,
			ТекущееЗначение,
			ПредставлениеПоля,
			ОписаниеТипов.КвалификаторыСтроки.Длина,
			ОписаниеТипов.КвалификаторыСтроки.Длина = 0 Или ОписаниеТипов.КвалификаторыСтроки.Длина > 100);
		Возврат;
	ИначеЕсли Тип = Тип("Дата") Тогда
		ПоказатьВводДаты(
			Обработчик,
			ТекущееЗначение,
			ПредставлениеПоля,
			ОписаниеТипов.КвалификаторыДаты.ЧастиДаты);
		Возврат;
	Иначе
		Возврат;
	КонецЕсли;
	Форма.ПоказатьВыборИзМеню(Обработчик, СписокВыбора);
КонецПроцедуры

Процедура ПослеВыбораЗначенияПримитивногоТипа(ВыбранноеЗначение, ПараметрыОбработчика) Экспорт
	Если ТипЗнч(ВыбранноеЗначение) = Тип("ЭлементСпискаЗначений") Тогда
		ВыполнитьОбработкуОповещения(ПараметрыОбработчика.ОбработчикРезультата, ВыбранноеЗначение.Значение);
	ИначеЕсли ТипЗнч(ВыбранноеЗначение) = Тип("Строка")
		Или ТипЗнч(ВыбранноеЗначение) = Тип("Число")
		Или ТипЗнч(ВыбранноеЗначение) = Тип("Дата") Тогда
		ВыполнитьОбработкуОповещения(ПараметрыОбработчика.ОбработчикРезультата, ВыбранноеЗначение);
	КонецЕсли;
КонецПроцедуры

#КонецОбласти