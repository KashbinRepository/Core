/*
 * Copyright (c) 2010 Subodh.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
 * 
DISCLAIMER: MyCentralSiteConfiguration template is not affiliated nor endorsed by DNN Corp. 
 * 
 */
using System;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Search;
using DotNetNuke.Services.Scheduling;

namespace MyCentralSiteConfiguration.Components
{
    /// <summary>
    /// 
    /// </summary>
    public class DnnModuleController : DnnModuleBase, ISearchable
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="modInfo"></param>
        /// <returns></returns>
        public SearchItemInfoCollection GetSearchItems(ModuleInfo modInfo)
        {
            var searchItemCollection = new SearchItemInfoCollection();
            return searchItemCollection;
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public class DnnModuleScheduler : SchedulerClient
    {
        private ScheduleHistoryItem oLogger = null;

        /// <summary>
        /// 
        /// </summary>
        public DnnModuleScheduler(ScheduleHistoryItem logger)
            : base()
        {
            oLogger = logger;

        }

        /// <summary>
        /// 
        /// </summary>
        public override void DoWork()
        {
            try
            {
                oLogger.Succeeded = true;

            }
            catch (Exception exp)
            {
                oLogger.Succeeded = false;
                oLogger.AddLogNote(exp.ToString());
                Errored(ref exp);
                DotNetNuke.Services.Exceptions.Exceptions.LogException(exp);
            }
        }
    }
}

