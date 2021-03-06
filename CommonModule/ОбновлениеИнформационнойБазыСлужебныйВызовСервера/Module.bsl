﻿////////////////////////////////////////////////////////////////////////////////
// Подсистема "Обновление версии ИБ".
// Серверные процедуры и функции обновления информационной базы
// при смене версии конфигурации.
//
////////////////////////////////////////////////////////////////////////////////

#Область СлужебныеПроцедурыИФункции

// См. описание этой же функции в модуле ОбновлениеИнформационнойБазыСлужебный.
Функция ВыполнитьОбновлениеИнформационнойБазы(ПриЗапускеКлиентскогоПриложения = Ложь, Перезапустить = Ложь, ВыполнятьОтложенныеОбработчики = Ложь) Экспорт
	
	ПараметрыОбновления = ОбновлениеИнформационнойБазыСлужебный.ПараметрыОбновления();
	ПараметрыОбновления.ПриЗапускеКлиентскогоПриложения = ПриЗапускеКлиентскогоПриложения;
	ПараметрыОбновления.Перезапустить = Перезапустить;
	ПараметрыОбновления.ВыполнятьОтложенныеОбработчики = ВыполнятьОтложенныеОбработчики;
	
	Попытка
		Результат = ОбновлениеИнформационнойБазыСлужебный.ВыполнитьОбновлениеИнформационнойБазы(ПараметрыОбновления);
	Исключение
		// Переход в режим открытия формы повторной синхронизации данных перед запуском
		// с двумя вариантами "Синхронизировать и продолжить" и "Продолжить".
		Если ОбщегоНазначения.ПодсистемаСуществует("СтандартныеПодсистемы.ОбменДанными")
		   И ОбщегоНазначения.ЭтоПодчиненныйУзелРИБ() Тогда
			МодульОбменДаннымиСервер = ОбщегоНазначения.ОбщийМодуль("ОбменДаннымиСервер");
			МодульОбменДаннымиСервер.ВключитьПовторениеЗагрузкиСообщенияОбменаДаннымиПередЗапуском();
		КонецЕсли;
		ВызватьИсключение;
	КонецПопытки;
	
	Перезапустить = ПараметрыОбновления.Перезапустить;
	Возврат Результат;
	
КонецФункции

// Снимает блокировку информационной файловой базы.
Процедура СнятьБлокировкуФайловойБазы() Экспорт
	
	ОбновлениеИнформационнойБазыСлужебный.ПриСнятииБлокировкиФайловойБазы();
	
КонецПроцедуры

#КонецОбласти
