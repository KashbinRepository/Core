<%@ WebHandler Language="C#" Class="Cross.Modules.Video.SilverlightFileUpload.FileUpload" %>
// see License.txt
using System;
using System.Web;
using Cross.DNN.Common.SilverlightUpload;
namespace Cross.Modules.Video.SilverlightFileUpload
{
    public class FileUpload : IHttpHandler
    {
        private HttpContext ctx;
        public void ProcessRequest(HttpContext context)
        {
            ctx = context;
            FileUploadProcess fileUpload = new FileUploadProcess(DotNetNuke.Common.Globals.ApplicationMapPath + "\\DesktopModules\\CrossVideo\\Temp\\",DotNetNuke.Entities.Host.Host.FileExtensions);
            fileUpload.FileUploadCompleted += new FileUploadCompletedEvent(fileUpload_FileUploadCompleted);
            fileUpload.ProcessRequest(context);
        }

        void fileUpload_FileUploadCompleted(object sender, FileUploadCompletedEventArgs args)
        {            
                       
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}