<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewCalendar.ascx.cs" Inherits="CoolDNN.Module.EventsCalendar.ViewCalendar" %>


<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement"
    Assembly="DotNetNuke.Web.Client" %>
<%@ Import Namespace="CoolDNN.Module.EventsCalendar" %>

<dnn:DnnCssInclude ID="DnnCssInclude1"  runat="server" FilePath="~/DesktopModules/CoolDNNEventCalendar/css/calendar.css" />
<dnn:DnnCssInclude ID="DnnCssInclude2"  runat="server" FilePath="~/DesktopModules/CoolDNNEventCalendar/css/custom_2.css" />

<dnn:DnnJsInclude ID="DnnJsInclude1"   runat="server" FilePath="~/DesktopModules/CoolDNNEventCalendar/js/modernizr.custom.63321.js"
    Priority="1" ForceProvider="DnnPageHeaderProvider" />

<dnn:DnnJsInclude ID="DnnJsInclude2"  runat="server" FilePath="~/DesktopModules/CoolDNNEventCalendar/js/jquery.calendario.js" />

<%--<dnn:DnnJsInclude  runat="server" FilePath="~/DesktopModules/CoolDNNEventCalendar/js/data.js" />--%>

<asp:Label runat="server" ID="lblMessage"></asp:Label>
<asp:Literal ID="Literal1" runat="server"></asp:Literal>
<asp:Literal ID="lblScript" runat="server"></asp:Literal>
<div class="main">
	<div class="custom-calendar-wrap">
		<div id="custom-inner" class="custom-inner">
			<div class="custom-header clearfix">
				<nav>
					<span id="custom-prev" class="custom-prev"></span>
					<span id="custom-next" class="custom-next"></span>
				</nav>
				<h2 id="custom-month" class="custom-month"></h2>
				<h3 id="custom-year" class="custom-year"></h3>
			</div>
			<div id="calendar" class="fc-calendar-container"></div>
		</div>
	</div>
</div>

<%--<script type="text/javascript" src="js/data.js">


</script>
--%>



<script type="text/javascript">
    $(function () {

        var transEndEventNames = {
            'WebkitTransition': 'webkitTransitionEnd',
            'MozTransition': 'transitionend',
            'OTransition': 'oTransitionEnd',
            'msTransition': 'MSTransitionEnd',
            'transition': 'transitionend'
        },
					transEndEventName = transEndEventNames[Modernizr.prefixed('transition')],
					$wrapper = $('#custom-inner'),
					$calendar = $('#calendar'),
					cal = $calendar.calendario({
					    onDayClick: function ($el, $contentEl, dateProperties) {

					        if ($contentEl.length > 0) {
					            showEvents($contentEl, dateProperties);
					        }

					    },
					    caldata: codropsEvents,
					    displayWeekAbbr: true
					}),
					$month = $('#custom-month').html(cal.getMonthName()),
					$year = $('#custom-year').html(cal.getYear());

        $('#custom-next').on('click', function () {
            cal.gotoNextMonth(updateMonthYear);
        });
        $('#custom-prev').on('click', function () {
            cal.gotoPreviousMonth(updateMonthYear);
        });

        function updateMonthYear() {
            $month.html(cal.getMonthName());
            $year.html(cal.getYear());
        }

        // just an example..
        function showEvents($contentEl, dateProperties) {

            hideEvents();

            var $events = $('<div id="custom-content-reveal" class="custom-content-reveal"><h3>' + dateProperties.monthname + ' ' + dateProperties.day + '</br> ' + dateProperties.year + '</h3></div>'),
						$close = $('<span class="custom-content-close"></span>').on('click', hideEvents);

            $events.append($contentEl.html(), $close).insertAfter($wrapper);

            setTimeout(function () {
                $events.css('top', '0%');
            }, 25);

        }
        function hideEvents() {

            var $events = $('#custom-content-reveal');
            if ($events.length > 0) {

                $events.css('top', '100%');
                Modernizr.csstransitions ? $events.on(transEndEventName, function () { $(this).remove(); }) : $events.remove();

            }

        }

    });
</script>
